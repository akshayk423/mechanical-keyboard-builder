package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.PCB;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PCBRepo extends JpaRepository<PCB,String> {
}
