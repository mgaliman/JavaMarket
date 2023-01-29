<%-- 
    Document   : register
    Created on : Jan 26, 2023, 1:45:22 PM
    Author     : mgaliman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
              integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
        <link rel="stylesheet" href="css/main.css">   
    </head>
    <body>
        <div class="container py-5">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card bg-dark text-white" style="border-radius: 1rem;">
                        <div class="card-body p-5 text-center">
                            
                            <form  id="registrationForm">
                                <div class="pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Register</h2>
                                    <p class="text-white-50 mb-5">Please enter your information!</p>

                                    <!-- First Name-->
                                    <div class="form-outline form-white mb-4">
                                        <input maxlength="50" required id="firstName" type="text" name="firstname" placeholder="First Name" class="form-control form-control-lg" />
                                    </div>

                                    <!-- Last Name -->
                                    <div class="form-outline form-white mb-4">
                                        <input maxlength="50" required id="lastName" type="text" name="lastname" placeholder="Last Name" class="form-control form-control-lg" />
                                    </div>

                                    <!-- Email Address -->
                                    <div class="form-outline form-white mb-4">
                                        <input maxlength="50" required id="email" type="email" name="email" placeholder="Email" class="form-control form-control-lg" />
                                    </div>

                                    <!-- Password -->    
                                    <div class="form-outline form-white mb-4">
                                        <input maxlength="50" required id="password" type="password" name="password" placeholder="Password" class="form-control form-control-lg" />
                                    </div>
                                    <p class="mb-4 lblPasswordError text-muted"></p>

                                    <!-- Password -->    
                                    <div class="form-outline form-white mb-4">
                                        <input maxlength="50" required id="passwordConfirmation" type="password" name="passwordConfirmation" placeholder="Confirm Password" class="form-control form-control-lg" />
                                    </div>
                                    <p class="mb-4 lblConfirmPasswordError text-muted"></p>

                                    <!-- Submit Button -->
                                    <button class="btn btn-outline-light btn-lg px-5" type="submit">Crate account</button>

                                </div>

                                <div>
                                    <p class="mb-0">Already Registered? <a href="login" class="text-white-50 fw-bold">Login</a>
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="javascript/register.js" defer></script>
    </body>
</html>