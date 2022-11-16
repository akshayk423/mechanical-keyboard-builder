package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.KeyboardPart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KeyboardPartRepo extends JpaRepository<KeyboardPart, String> {
}
