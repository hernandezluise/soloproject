package com.luishernandez.soloproject.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.luishernandez.soloproject.models.JobPost;

@Repository
public interface JobPostRepository extends CrudRepository<JobPost, Long> {

	List<JobPost> findAll();
}
