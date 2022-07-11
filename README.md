
![Header](https://i.imgur.com/BJaItEK.png)
# introduction

### Topic

This is a project for an imaginary courier company. PostBox Is a company that provides courier services using parcel machines. The idea is based on the Inpost company. 

The application was created just for customers. It is supposed to allow him:
* to set up/log in an account, 
* order a package, 
* view the list of incoming/shipped packages, 
* see the history of selected packages, 
* view/edit his profile.

## architekture

For this purpose, I created:
* database in Postgres
* api in Golang using gin-gonic and go-pg packages
* user interface using Dart language and Flutter framework.

The application server was hosted on Google Cloud Platform, sending emails was done using Mailjet platform

![architekture](https://i.imgur.com/pQgaNFm.png)

## repositories

* [Flutter user interface](https://github.com/makjac/Flutter_PostBox_app)
* [Golang api](https://github.com/makjac/Golang_PostBox_api)
## Used Packages

* **http**

    To communicate with the api using http requests.
* **flutter_bloc**

    Bloc architecture to make HTTP request.
* **shared_preferences**
* **form_validator**

##Example Screenshots

[link to Youtube video](https://www.youtube.com/watch?v=tZ9cyRZ0VjE)

![image 1](https://i.imgur.com/P94pSLH.jpg)
![image2](https://i.imgur.com/F6hvLKf.jpg)
![image3](https://i.imgur.com/vFh7nKq.jpg)
![image4](https://i.imgur.com/qVf1BTF.jpg)
![image5](https://i.imgur.com/yFSOMuf.jpg)
