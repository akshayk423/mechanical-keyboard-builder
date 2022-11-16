package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.KeyboardCases;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KeyboardCaseRepo extends JpaRepository<KeyboardCases,String> {
}
