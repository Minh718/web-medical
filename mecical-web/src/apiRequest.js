import axios from "axios";

const url_database = "http://localhost:8800/api";
export const registerUser = async (newUser) => {
    try{

        const data = await axios.post(`${url_database}/users/register`, newUser);
        return data
    }
    catch(err){
        return err.response
        console.log(err)
    }
    // return data.response;
  };
  export const loginUser = async (user) => {
    try{
    const data = await axios.post(`${url_database}/users/login`, user);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
  };
  export const updateUserInfo = async (user) => {
    try{
    const data = await axios.post(`${url_database}/users/update_info`, user);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };
  export const changePassword = async (user) => {
    try{
    const data = await axios.post(`${url_database}/users/change_password`, user);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };
  export const deleteUser = async (user) => {
    try{
    const data = await axios.get(`${url_database}/users/delete_user/${user.id}`);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };
    export const getClinics = async () => {
    try{
    const data = await axios.get(`${url_database}/clinics`);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };
  export const getPeopleInMonth = async (user) => {
    try{
    const data = await axios.post(`${url_database}/users/month`, user);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };
  export const getStasusAppsInDate = async (user) => {
    try{
        console.log(user)
    const data = await axios.post(`${url_database}/clinics/appsInDate`, user);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };
  export const updateApp = async (user) => {
    try{
        console.log(user)
    const data = await axios.post(`${url_database}/clinics/updateApp`, user);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };

  export const deleteApp = async (app) => {
    try{
    const data = await axios.get(`${url_database}/clinics/delete_app/${app.id}`);
    return data
}
    catch(err){
        return err.response
        // console.log(err)
    }
    
  };