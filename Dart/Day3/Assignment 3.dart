// Create a class User with:
// • Private variable _username
// • Setter that validates (not empty) => search about it !!!!
// • Getter to return username

class User{
  String _username = "";

  String get username => _username;

  set username(String user){
    if(user.isNotEmpty){
      _username = user;
    }
  }
}


void main(){

    User u = User();

    u._username="alyaa";

    print(u._username);

}