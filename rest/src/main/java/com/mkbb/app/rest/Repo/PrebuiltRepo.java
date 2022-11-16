package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Prebuilt;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrebuiltRepo extends JpaRepository<Prebuilt,String> {
}
