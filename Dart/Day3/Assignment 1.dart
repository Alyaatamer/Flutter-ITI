// 1. Explain the difference between Class and Object with a real-life example.

          // class : blueprint , object : instance of class
          // example :
          class car{
            int Year;
            car(this.Year); //paramtized
          }

          void main(){
            car c1 = car(2025);
            print(c1.Year);
          }
      

// 2. What is a Constructor? What types of constructors does Dart support?

          //constructor is special method that runs when object is created
          // types : default , paramtized


// 3. How does Dart handle Access Modifiers? Does it have public/private/protected like Java?
        //everything is public by default
        //(encapsulation) => private => use _ 

// 4. What is Encapsulation? How can you implement it in Dart using Getter and Setter?

        //(encapsulation) => hide data because not anyone can access to private data 

// 5. Why should we use a Setter instead of making a variable public?

        //because setter is used to prevent access but public is avariable for anyone
