package com.hitema.jee.mvc.services;

import com.hitema.jee.mvc.entities.Country;
import com.hitema.jee.mvc.repositories.CountryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CountryServiceImpl implements CountryService {

    private static final Logger log = LoggerFactory.getLogger(CountryServiceImpl.class);

    private final CountryRepository repository;

    public CountryServiceImpl(CountryRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Country> readAll() {
        return repository.findAll();
    }

    @Override
    public Country create(Country country) {
        log.info("Creating country: {}", country);
        return repository.save(country);
    }

    @Override
    public Optional<Country> read(Long id) {
        log.info("Reading country with id: {}", id);
        return repository.findById(id);
    }

    @Override
    public Country update(Long id, Country country) {
        log.info("Updating country with id: {} with data: {}", id, country);
        Optional<Country> existingCountry = repository.findById(id);

        if (existingCountry.isPresent()) {
            Country updatedCountry = existingCountry.get();
            updatedCountry.setName(country.getName());
            updatedCountry.setLastUpdate(country.getLastUpdate());
            repository.save(updatedCountry);
            return updatedCountry;
        } else {
            log.warn("Could not find country with id: {}", id);
            return null;
        }
    }

    @Override
    public boolean delete(Long id) {
        log.info("Deleting country with id: {}", id);
        Optional<Country> countryToDelete = repository.findById(id);

        if (countryToDelete.isPresent()) {
            repository.delete(countryToDelete.get());
            return true;
        } else {
            log.warn("Could not find country with id: {}", id);
            return false;
        }
    }
}
