package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Accessories;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccessoriesRepo extends JpaRepository<Accessories,String> {
}
