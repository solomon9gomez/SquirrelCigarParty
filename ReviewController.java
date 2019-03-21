package com.techelevator;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.Review;
import com.techelevator.model.ReviewDao;



@Controller
public class ReviewController {
	
	
	@Autowired
	private ReviewDao dao;
	
	
	@RequestMapping("/greeting")
	public String squirrelReview(ModelMap modelMap) {
		List<Review> allReviews = dao.getAllReviews();
		modelMap.put("reviews", allReviews);
		return "greeting";
	}
	
	@RequestMapping("/newSquirrelReview")
	public String SquirrelPostsForm() {
		
		return "/newSquirrelReview";
	}
	
	@RequestMapping(path="/newSquirrelReview", method=RequestMethod.POST)
	public String processSquirrelReview(@ModelAttribute Review review) {
		review.setDateSubmitted(LocalDateTime.now());
		dao.save(review);
		return "redirect:/greeting";
	}
	
	
}
