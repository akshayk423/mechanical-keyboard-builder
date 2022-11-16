package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Mods;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ModRepo extends JpaRepository<Mods,String> {
}
