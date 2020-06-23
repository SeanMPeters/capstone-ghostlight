package com.capt.inv.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.capt.inv.model.Companies;
import com.capt.inv.model.ContactInfo;
import com.capt.inv.model.PaymentMethod;
import com.capt.inv.model.Reviews;
import com.capt.inv.model.Users;
import com.capt.inv.repository.CompanyRepository;
import com.capt.inv.repository.ContactInfoRepository;
import com.capt.inv.repository.PaymentMethodRepository;
import com.capt.inv.repository.ReviewRepository;
import com.capt.inv.service.CompanyService;
import com.capt.inv.service.UserService;
import com.capt.inv.utils.DataValidation;
import com.capt.inv.utils.States;
import com.capt.inv.utils.WebUtils;

@Controller
@SessionAttributes({ "loggedInuser", "role" })
@Transactional
public class AppController {

	@Autowired
	private UserService userService;
	// private UserRepository userRepository;
	@Autowired
	private CompanyService companyService;

	@Autowired
	private ContactInfoRepository contactInfoRepository;

	@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private DataValidation dataValidation;

	@Autowired
	private WebUtils webUtils;

	@Autowired
	private PaymentMethodRepository paymentMethodRepository;

	@GetMapping({ "/", "home" })
	String home(Model model) {
		model.addAttribute("msg", "Home Page");
		return "home";
	}

	@GetMapping("about")
	String about(Model model) {
		model.addAttribute("msg", "About us page");
		return "about";
	}

	@GetMapping("addCompany")
	String addCompany(Model model) {
		model.addAttribute("companies", new Companies());
		return "addCompany";
	}

	@PostMapping("addCompany")
	String addCompany(Model model, @RequestParam String compName, @RequestParam String compPhone, @RequestParam String compStreet,
			@RequestParam String compCity, @RequestParam String compState, @RequestParam String compZip, @RequestParam String compSeating,
			@RequestParam String compStatus, @RequestParam String compUrl, @ModelAttribute Companies company, BindingResult result) {
		
		Companies o = new Companies();
		//o.setCompanyId((long) Math.random());
		o.setCompName(compName);
		o.setCompPhone(compPhone);
		o.setCompState(compState);
		o.setCompCity(compCity);
		o.setCompStreet(compStreet);
		o.setCompZip(compZip);
		o.setCompSeating(compSeating);
		o.setCompUrl(compUrl);
		
		model.addAttribute("compStatus", company.getCompStatus());
		
		if ("Closed".equalsIgnoreCase(company.getCompStatus())) { 
			o.setCompStatus("Closed");
			}
		o.setCompStatus("Open");
		model.addAttribute("newCompany", o);
		Companies newCompany = (Companies) model.getAttribute("newCompany");
		//System.out.println("%%%%%"+newCompany.getCompName());
		model.addAttribute("company_account", newCompany);
		dataValidation.compValidate(company, result);
		if (result.hasErrors()) {
			return "addCompany";
		}
		companyRepository.save(o);
		model.addAttribute("msg", "Added New Company");
		return "addCompanyImg";

	}
	
	@PostMapping("addReview")
	String addReview(@SessionAttribute("loggedInuser") String email, Model model,
	@RequestParam String text, @RequestParam Long companyId, @ModelAttribute Reviews review, RedirectAttributes redirect) {
		
		Reviews r = new Reviews();
	
		Companies company = companyService.findByCompanyId(companyId).get();
		Users user = userService.findByEmail(email).get();
		model.addAttribute("user", user);
		/*
		 * if (findUser.isPresent()) { model.addAttribute("user", email); }
		 */
			
		Date myDate = new Date();
		System.out.println(myDate.toString());
		
		r.setMyDate(myDate);
		r.setText(text);
		r.setCompany(company);
		r.setUser(user);
		model.addAttribute("newReview", r);
		Reviews newReview = (Reviews) model.getAttribute("newReview");
		model.addAttribute("review_account", newReview);
		
		reviewRepository.save(r);
		
		model.addAttribute("msg", "Review added");
		return"redirect:search";
	}	
	
	@GetMapping("addCompanyImg")
	String addCompanyImg(Model model) {
		Companies newCompany = (Companies) model.getAttribute("newCompany");
		//System.out.println("****"+newCompany.getCompName());
		model.addAttribute("msg", "Add Company Image");
		model.addAttribute("company_account", newCompany);
		return "addCompanyImg";
	}

	@GetMapping("admin")
	String admin(Model model) {
		model.addAttribute("users", userService.findAll());
		// model.addAttribute("list", userRepository.findAll().toString());
		model.addAttribute("msg", "Users Found ");
		return "admin";
	}

	@GetMapping("contactus")
	String cont(Model model) {
		model.addAttribute("msg", "Contact");
		return "contact";
	}

	@GetMapping("deleteuser")
	String deleteuser(@RequestParam Long id, RedirectAttributes redirect) {
		userService.deleteUser(id);
		redirect.addFlashAttribute("success", "Delete Success");
		return "redirect://admin";
	}

	@PostMapping("editrole")
	String editrole(@RequestParam String role, @RequestParam Long id, RedirectAttributes redirect) {

		userService.addRole(id, role);
		redirect.addFlashAttribute("success", "Role Assigned Success");
		return "redirect://admin";
	}

	@GetMapping("expired")
	String expiredsession(SessionStatus status, Model model) {

		status.setComplete();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");
		model.addAttribute("expired", "You have been logged out due to inactivity");
		return "login";
	}

	@ModelAttribute("contact_info")
	ContactInfo info() {
		return new ContactInfo();
	}

	@GetMapping("login")
	String login(Model model) {
		model.addAttribute("title", "Login");
		model.addAttribute("msg", "Please Login");
		return "login";
	}

	@PostMapping("login")
	String login(@RequestParam String email, @RequestParam String password, RedirectAttributes redirect, Model model) {

		Optional<Users> findUser = userService.login(email, password);
		if (findUser.isPresent()) {
			model.addAttribute("loggedInuser", email);
			model.addAttribute("role", findUser.get().getRole());
			redirect.addFlashAttribute("msg", "Welcome");
		} else {
			redirect.addFlashAttribute("error", "Invalid Credentials");
			return "redirect:login";
		}
		return "redirect:profile";
	}

	@GetMapping("logout")
	String logout(Model model, SessionStatus status) {
		status.setComplete();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");
		model.addAttribute("msg", "Logout Successful");
		return "login";
	}

	@GetMapping("profile")
	String profile(@SessionAttribute("loggedInuser") String email, Model model) {
		Optional<Users> user = userService.findByEmail(email);

		model.addAttribute("user_account", user.get());

		if (user.get().getContactinfo() != null) {
			model.addAttribute("contact_info", user.get().getContactinfo());
		}

		return "profile";
	}

	@GetMapping("about-us")
	String red(RedirectAttributes redirect) {
		redirect.addFlashAttribute("success", "This is redirect message");
		return "redirect:/about";
	}

	@GetMapping("register")
	String reg(Model model) {
		model.addAttribute("users", new Users());
		return "register";
	}

	@PostMapping("register")
	String register(Model model, @ModelAttribute Users user, BindingResult result, RedirectAttributes redirect) {

		dataValidation.validate(user, result);
		if (result.hasErrors()) {
			return "register";
		}
		
		model.addAttribute("role", user.getRole());
		
		if (!"USER".equalsIgnoreCase(user.getRole())) { 
			user.setRole("DBA"); userService.save(user);
			return "redirect:addCompany"; 
			}
		

			user.setRole("USER");
			userService.save(user);
			model.addAttribute("msg", "Registration Success. Thank you " + user.getFname());
			return "login";
	}
	
	@GetMapping("reviews")
	String reviews(Model model) {
		model.addAttribute("msg", "Reviews");
		return "reviews";
	}
	
	@PostMapping("savecontact")
	String savecontact(@ModelAttribute ContactInfo info, RedirectAttributes redirect) {
		contactInfoRepository.save(info);
		redirect.addFlashAttribute("msg", "Contact saved");
		return "redirect:/profile";
	}
	
	@GetMapping("singlepage")
	String singlepage(Long companyId, Model model) {
		Optional<Companies> company = companyService.findByCompanyId(companyId);
		model.addAttribute("company_account", company.get());
		
		//Optional<Users> user = userService.findById(id);
		//model.addAttribute("user_account", user.get());

		
		//System.out.println(company.get().getReview().get(0).getText());
		return "singlepage";
	}
	
	@GetMapping("search")
	String search(Model model) {
		model.addAttribute("companies", companyService.findAll());
		// model.addAttribute("list", companyRepository.findAll().toString());
		model.addAttribute("msg", "Companies Found ");
		return "search";

	}

	/*
	 * @PostMapping("adminSearch") String adminSearch(@RequestParam String keyword,
	 * Model model) { model.addAttribute("users", userService.searchUser(keyword));
	 * model.addAttribute("msg", "User(s) Found "); return "admin"; }
	 */
	
	  
	/*
	 * @PostMapping("search") String search(@RequestParam String keyword, Model
	 * model) { model.addAttribute("company",
	 * companyService.searchCompany(keyword)); model.addAttribute("msg",
	 * "Search Results"); return "search"; }
	 */


	@PostMapping("sendemail")
	String sendemail(Model model, @RequestParam String email, @RequestParam String name, @RequestParam String message,
			@RequestParam String subject) {
		try {
			webUtils.sendMail(email, message + " From " + name, subject);
			model.addAttribute("msg", "Thank you " + name + ". Email sent :) ");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "contact";
	}
	
	/*
	 * @PostMapping("setUpdateEmail") String setUpdateEmail(Model
	 * model, @RequestParam String compStatus) {
	 * 
	 * 
	 * return "singlepage";
	 * 
	 * }
	 * 
	 * @PostMapping("sendUpdateEmail") String sendUpdateEmail(Model
	 * model, @RequestParam String email, @RequestParam String name, @RequestParam
	 * String message,
	 * 
	 * @RequestParam String subject, @RequestParam String compStatus) {
	 * 
	 * model.getAttribute(compStatus);
	 * 
	 * try { webUtils.sendUpdate(email, message + " From " + name, subject);
	 * model.addAttribute("msg", "Thank you " + name +
	 * ". Email will be sent once this status changes."); } catch (Exception e) {
	 * 
	 * e.printStackTrace(); } return "profile"; }
	 */

	@GetMapping("signup")
	String signup(RedirectAttributes redirect) {
		redirect.addFlashAttribute("success", "Redirect message");
		return "redirect:/home";
	}

	@PostMapping("updatecontact")
	String updatecontact(@ModelAttribute ContactInfo contact_info, RedirectAttributes redirect) {

		try {
			Users user = userService.findById(contact_info.getId()).get();
			contact_info.setUser(user);
			contactInfoRepository.save(contact_info);
			redirect.addFlashAttribute("success", "Address Updated");
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return "redirect:profile";

	}

	@PostMapping("updateUser")
	String updateUser(RedirectAttributes redirect, @RequestParam String fname, @RequestParam String lname,
			@RequestParam String email) {

		userService.updateUser(fname, lname, email);
		redirect.addFlashAttribute("success", "User updated" + fname);

		return "redirect:admin";

	}

	@PostMapping("addcard")
	String addcarding(@RequestParam Long id, @RequestParam String cardno, @RequestParam String secode,
			@RequestParam String expiry, RedirectAttributes redirect) {

		Users user = userService.findById(id).get();
		PaymentMethod pay = new PaymentMethod();
		pay.setCardno(cardno);
		pay.setExpiry(expiry);
		pay.setSecode(secode);
		pay.setUser(user);
		paymentMethodRepository.save(pay);

		return "redirect:profile";

	}

	@GetMapping("deletecard")
	String removecard(@RequestParam Long id, RedirectAttributes red) {

		paymentMethodRepository.deleteById(id);
		red.addFlashAttribute("success", "Card Deleted");
		return "redirect:profile";

	}

	@PostMapping("/addimages")
	public String addprofileImg(@RequestParam MultipartFile file, @RequestParam Long id, RedirectAttributes model) {

		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg|pdf|gif))$)");
		try {

			if (file != null && file.isEmpty()) {
				model.addFlashAttribute("error", "Error No file Selected ");
				return "redirect:profile";
			}
			if (file.getSize() > 1073741824) {
				model.addFlashAttribute("error",
						"File size " + file.getSize() + "KB excceds max allowed, try another photo ");
				return "redirect:profile";
			}
			Matcher mtch = ext.matcher(file.getOriginalFilename());

			if (!mtch.matches()) {
				model.addFlashAttribute("error", "Invalid Image type ");
				return "redirect:profile";
			}
			// save image
			webUtils.addProfilePhoto(file, id, "users");
			model.addFlashAttribute("success", "Upload success " + file.getSize() + " KB");

		} catch (Exception e) {
			// e.printStackTrace);
		}
		return "redirect:profile";

	}

	@PostMapping("/addcompimages")
	public String addcompanyImg(@RequestParam MultipartFile file, @RequestParam Long id, RedirectAttributes model) {
		//System.out.println("ID" + id);
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg|pdf|gif))$)");
		//Optional<Companies> company = companyRepository.findById(id);
		try {
			if (file.getSize() > 1073741824) {
				model.addFlashAttribute("error",
						"File size " + file.getSize() + "KB excceds max allowed, try another photo ");
				return "redirect:addCompanyImg";
			}
			Matcher mtch = ext.matcher(file.getOriginalFilename());

			
			  if (!mtch.matches()) { model.addFlashAttribute("error",
			  "Invalid Image type "); return "redirect:addCompanyImg"; }
			 
			// save image
			webUtils.addCompanyPhoto(file, id, "company");
			model.addFlashAttribute("success", "Upload success " + file.getSize() + " KB");

		} catch (Exception e) {
			// e.printStackTrace);
		}
		return "thankYou";

	}
	
	
	@ModelAttribute("states")
	public List<States> populateStates() {
		return Arrays.asList(States.values());
	}



}
