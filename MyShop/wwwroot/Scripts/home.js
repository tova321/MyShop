const onNewUserClick = () => {
    const loginForm = document.querySelector('.loginForm'); // טופס הכניסה
    const signInForm = document.querySelector('.signIn'); // טופס הרישום

    // מסתיר את טופס הכניסה ומציג את טופס הרישום
    loginForm.style.display = "none";
    signInForm.style.display = "block";
}
const hideSignInWhenUserIsIn = () => {
    const hide = document.querySelector(".signIn");
    hide.classList.remove("signIn");
};

const hideUpdate = () => {
    const hide = document.querySelector(".update");
    hide.classList.remove("update");
};
const showUpdate = () => {
    // בודק אם יש id של משתמש בסשן
    const userId = sessionStorage.getItem("userId");

    if (!userId) {
        alert("You must log in first")

        window.location.href = "home.html"; // הכנס את שם הדף של טופס הכניסה
    } else {
        // אם יש id, הצג את טופס העדכון
        const updateForm = document.querySelector(".update");
        updateForm.style.display = "block"; // מציג את טופס העדכון
    }
};

const getAllUserDetails = () => {
    const email = document.querySelector("#userName").value;
    const password = document.querySelector("#password").value;
    const firstName = document.querySelector("#firstName").value;
    const lastName = document.querySelector("#lastName").value;
    return { email, password, firstName, lastName };
};

const getDataForLogIn = () => {
    const email = document.querySelector("#loginUserName").value;
    const password = document.querySelector("#loginPassword").value;
    return { email, password };
};

const validationCheck = async (user) => {
    if (!user.email || !user.password || !user.firstName || !user.lastName) 
        return "All fields are required";
    
    if (user.firstName.length < 2 || user.firstName.length > 20) 
        return "First name must be between 2 to 20 characters";
    
    if (user.lastName.length < 2 || user.lastName.length > 20) 
        return "Last name must be between 2 to 20 characters";
    
    if (user.password.length > 10)
        return "Password must be shorter than 20 characters";
    
    const level = await checkPassword();
    if (level < 3) 
        return "Password is too weak";
    
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(user.email)) 
        return "Email address is incorrect";
    
    return "ok";
};

const checkPassword = async () => {
    try {
        const progress = document.querySelector("#progress");
        const password = document.querySelector("#password").value;
        const responsePost = await fetch(`api/Users/password/?password=${password}`, {
            method: 'post',
            headers: { 'Content-Type': 'application/json' }
        });
        const dataPost = await responsePost.json();
        progress.value = Number(dataPost);
        return Number(dataPost);
    } catch {
        alert("Error checking password strength");
    }
};

const signIn = async () => {
    const newUser = getAllUserDetails();
    const res = await validationCheck(newUser); 
    if (res !== "ok") {
        return alert(res);
    }
  
    try {
        const responsePost = await fetch('api/Users', {
            method: 'post',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(newUser)
        });
        const dataPost = await responsePost.json();
        if (responsePost.status === 400)
            throw new Error("The password is weak");
        alert("User added");
    } catch (error) {
        alert(error.message); 
    }
};

const logIn = async () => {
    const newUser = getDataForLogIn();
    if (!newUser.email || !newUser.password) {
        return alert("All fields are required");
    }
    try {
        const responsePost = await fetch(`api/Users/login/?email=${newUser.email}&password=${newUser.password}`, {
            method: 'post',
            headers: { 'Content-Type': 'application/json' }
        });
        if (responsePost.status === 204)
            return alert("User not found");

        const dataPost = await responsePost.json();
        alert(`WELCOME ${dataPost.firstName}`);
        sessionStorage.setItem("userId", dataPost.userId);
        window.location.href = "Products.html";
    } catch (error) {
        alert(`HTTP error! status ${responsePost.status}`);
    }
};

const updateDetails = async () => {
    debugger
    const newUser = getAllUserDetails();
    const res = await validationCheck(newUser);
    if (res !== "ok") {
        return alert(res);
    }
    try {
        const responsePut = await fetch(`api/Users/${JSON.parse( sessionStorage.getItem("id"))}`, {
            method: 'put',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(newUser)
        });
        if (responsePut.status === 400) {
            throw new Error("The password is weak");
        }
        alert("User updated successfully");
    } catch (error) {
        alert(`HTTP error! status ${error.message}`);
    }
};
