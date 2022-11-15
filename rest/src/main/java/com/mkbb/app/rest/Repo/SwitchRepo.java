package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Switches;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SwitchRepo extends JpaRepository<Switches,String> {
}
