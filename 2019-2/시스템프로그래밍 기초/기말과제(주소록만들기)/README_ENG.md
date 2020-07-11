# Create an contacts program
** Deadline: ** Dec. 22, 2019
** How to submit: ** No need to submit separately. If you write your code thourgh the projects menu in our repl.it classroom, it will be graded on the 23rd.
** NOTE: ** If you write in your own way other than the projects menu, it will not be graded and will be scored zero.

### 1. Information to save in contacts
Your contacts store a name, phone number, and birthday.
* Name can be up to 20 bytes except '\ 0'
* Phone number up to 15 bytes except '-'
* Birthday is 8bytes in YYYYMMDD format

You don't need to worry about correctness of information entered in name, phone number and birthday. Names are entered in English and there is no duplicated name, but the rest of the information can be. It should be able to store up to 100 people's information. Information is represented using structures, and arrays are used to store information from different people. That is, it uses an array of structures. If necessary, other additional information can be stored in the structure.

### 2. Functions
The program should include the following features:
* A function to register a person's information input
* A function to delete information by searching by name
* Input the desired month and print out the information of the person who has birthday in the month
* Ability to print the information of all registered persons

The registration function receives a name, phone number, and birthday from the user and stores it in the program. When printing a person's information, print out the name, phone number, and birthday.

### 3. User Interfaces
It operates through console menu and uses standard I / O. When the program runs for the first time, it prints a menu and waits for input. Menu is `1. Registration, 2. Show all, 3. Delete, 4. FindByBirth, 5. Exit`. Perform the appropriate operation according to the selected menu, then Exit when `5. Exit` is selected. When selecting a menu, the guide screen is displayed using the following code.
```
printf ("***** Menu ***** \ n");
printf ("1. Registration, 2. ShowAll, 3. Delete, 4. FindByBirth, 5. Exit \ n");
printf ("Enter the menu number:");
```
The user enters a number between 1 and 5, and assumes no other numbers.

  ##### 3-1. Registration
  When 1 is entered (select `1. Registration` menu), take the information using the code below.
  Enter your name, phone number, and birthday.
  ```
  printf ("Name:"); // fixed
  ...
  printf ("Phone number:"); // fixed
  ...
  printf ("Birth:"); //fixing
  ...
  ```
  When registration is completed, displays the number of contacts currently stored using the `printf (“ count:% d \ n ”, ..);` statement and than return to the menu. If the maximum number of records is exceeded, execute `printf (" Overflow. \ N ");` statement and return to the menu.

  ##### 3-2. ShowAll
  If 2 is entered (select `2. ShowAll` menu), the information of all registered people is displayed in the order of saving. Print out the registered person's information one by one using the code below.
  ```
  printf ("% s% s% s \ n", ...);
  ```
  However, if there is no registered information, it returns to the menu without outputting anything.
  
  ##### 3-3. Delete  
  When 3 is entered (select '3. Delete' menu), take the name using the code below.
  ```
  printf ("Name:"); // fixed
  ...
  ```
  Delete the information corresponding to the name. If the information does not exist, run `printf (" No record founded. \ N ");` and return to the menu.
  
  ##### 3-4. FindByBirth
  If 4 is entered (select '4.FindByBirth' menu), the birthday month is entered as below code.
  ```
  printf ("Birth:"); // fixed
  ...
  ```
  The user enters a number between 1 and 12, and assumes no wrong numbers. Print the information (name, phone number, birthday) of person who has birthday in the month of input using the code below.
  ```
  printf ("% s% s% s \ n", ...);
  ```
  If there are several people who have birthdays in the same month, print them out in the order in which they are stored. If no user is your birthday, ignore it and return to the menu.
  
  ##### 3-5. Exit
  If 5 is entered (select `5. Exit` menu), the program will exit.

### 4. Conditions
The following functions should be implemented and used. (You may implement more fine-grained functionss than what is shown.)
-Function to handle data registration
-Function to handle the entire view
-Function to handle data deletion
-Function to retrieve members who are birthdays in a given month

### 5. Input Format
It is entered as standard input (`stdin`). In the menu selection area, a number between 1 and 5 is entered. In the name, phone number, and birthday fields, one string is entered. Assume that there is no wrong input. The duplicated name is not entered.

### 6. Output Format
Print to `stdout`. When outputting the guide screen and the registered person's information, the above code is used as it is.

### ★ Extra score 1
If you store the input data in ABC order, you can get additional score. The ABC order refers to the order in ASCII code and can be determined using the `strcmp` function. In this case, the order of the person information displayed on the screen may different with examples.

### ★ Extra Score 2
If you split the source code and header files to enable split compilation, you can get additional score. Source code must consist of at least three. For example, you can split header files into structure declarations, variable declarations, and function declarations. Header files are adjusted to be included only when necessary using `#ifndef`. Other types of header files or source codes can be modified by the author.

### ★ Extra Score 3
If you use a pointer rather than an array in the structure that will store your contacts, you'll get additional score. The following code is an example of a structure using an array.
```
struct structure_name {
  char name_variable[21];
  char telephone_number_variable[16];
  char birthday_variable[9];
};
struct structure_name structure_variable_name [100];
```
To get additional scores, use the code below instead of the code above.
```
struct structure_name {
  char *name_variable;
  char *phone_number_variable;
  char *birthday_variable;
};
struct structure_name **struct_variable_name;
```
If necessary, you can add fields to the structure.

### ★ Extra Score 4
If you expand the data to receive infinitely, you can get additional score. In this case, overflow does not occur even if more than 100 data are received, and infinite data can be stored as long as memory allows. (Hint: linked list)

### ★ Extra Score 5
You can get additional scores if you use files to manage your contacts. This requires reading the user's information from the file and fill the data at program startup. When new data is entered, the corresponding person information should be recorded in a file. If you delete information, you need to delete the person's information from the file too.

### ** Caution **
Do not use additional outputs other than the ones given, as any gaps can cause the scoring system to answer incorrectly. Program source should be indented and commented appropriately. Write programs using only standard functions (eg `string.h`). algorithm headers and STL not available. Refer to EXAMPLE files for an example of I / O test.