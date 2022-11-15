package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Reported;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportedRepo extends JpaRepository<Reported,String> {
}
