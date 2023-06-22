package com.luishernandez.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luishernandez.soloproject.models.JobPost;
import com.luishernandez.soloproject.repository.JobPostRepository;

@Service
public class JobPostService {

	@Autowired
	private final JobPostRepository jobPostRepository;
	
	public JobPostService(JobPostRepository jobPostRepository) {
		this.jobPostRepository = jobPostRepository;
	}
	
	// gets all jobpost
	public List<JobPost> allJobPosts(){
		return jobPostRepository.findAll();
	}
	
	// creates jobpost
	public JobPost createJobPost(JobPost b) {
		return jobPostRepository.save(b);
	}
	
	
	// updates jobpost
	public JobPost updateJobPost(JobPost b) {
		return jobPostRepository.save(b);
	}
	
	// finds job post by id
	public JobPost findJobPost(Long id) {
		Optional<JobPost> optionalJobPost = jobPostRepository.findById(id);
		if(optionalJobPost.isPresent()) {
			return optionalJobPost.get();
		} else {
			return null;
		}
	}
	
	// delete post
	public void deleteJobPost(JobPost b) {
		jobPostRepository.deleteById(b.getId());
	}
	
	public void deleteJobPost(long id) {
		jobPostRepository.deleteById(id);
	}
}


