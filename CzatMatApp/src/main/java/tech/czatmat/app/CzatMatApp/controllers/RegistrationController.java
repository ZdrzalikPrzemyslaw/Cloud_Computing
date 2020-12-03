package tech.czatmat.app.CzatMatApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import tech.czatmat.app.CzatMatApp.users.User;
import tech.czatmat.app.CzatMatApp.users.UserRepository;

import javax.servlet.http.HttpServletResponse;


@RestController
@RequestMapping("/registration")

// TODO: 27.11.2020 : https://www.codebyamir.com/blog/user-account-registration-with-spring-boot
public class RegistrationController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    private final UserRepository userRepository;

    public RegistrationController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // TODO: 27.11.2020 Nie jestem pewien implementacji
    // TODO: 27.11.2020 Sprawdzać czy udało się dodać usera

    // TODO: 28.11.2020 Obsługiwać brak kolumn i zwracac odpowiedni error
    @RequestMapping(value = "", method = RequestMethod.POST, produces = "application/json")
    public String createUser(@RequestBody User user, HttpServletResponse response) {
        user.setEnabled(1);
        if (userRepository.existsByUsername(user.getUsername())) {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            // TODO: 27.11.2020 Make throw exepction?
            return ("User By That Login Already Exists");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        response.setStatus(HttpServletResponse.SC_CREATED);
        return ("User successfully created");
    }

    // TODO: 27.11.2020 Ograniczyć możliwość używania zapytania
    @RequestMapping(value = "/get_users", method = RequestMethod.GET, produces = "application/json")
    public Iterable<User> getUsers() {
        return userRepository.findAll();
    }

    @RequestMapping(value = "/przyklad", method = RequestMethod.GET, produces = "application/json")
    public String getPrzyklad() {
        return "Siema Registration";
    }
}
