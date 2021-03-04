package by.bsuir.menkovskaya.init;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery(
                        "select username,password, enabled from users where username=?")
                .authoritiesByUsernameQuery(
                        "select username, role from user_roles where username=?")
                .passwordEncoder(new ShaPasswordEncoder(256));
    }

        @Override
        protected void configure(HttpSecurity http) throws Exception {

            http.authorizeRequests()
                    .antMatchers("/client/**").access("hasRole('ROLE_CLIENT')")
                    .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                    .antMatchers("/coach/**").access("hasRole('ROLE_COACH')")
                    .and()
                    .formLogin().loginPage("/login")
                    .usernameParameter("username").passwordParameter("password")
                    .successHandler(new AuthSuccessHandler())
                    .and()
                    .logout().logoutSuccessUrl("/loginnew?logout")
                    .and()
                    .exceptionHandling().accessDeniedPage("/403")
                    .and()
                    .csrf();

        }
}
