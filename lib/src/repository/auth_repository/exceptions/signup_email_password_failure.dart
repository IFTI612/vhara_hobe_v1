class signUpWithEmailPasswordFailure{
   final String message;

  const signUpWithEmailPasswordFailure([this.message= "An Unknown Error occurred."]);

  factory signUpWithEmailPasswordFailure.code(String code)
  {
    switch(code){
      case'weak_password':
        return const signUpWithEmailPasswordFailure('Please enter a strong password.');
      case'invalid_email':
        return const signUpWithEmailPasswordFailure('Email is not valid or badly formatted');
      case'email_already_in_user':
        return const signUpWithEmailPasswordFailure('An account already exists for that email.');
      default: return const signUpWithEmailPasswordFailure();
    }

  }



}