
Install Groovy plugin in jenkins:

![image](https://user-images.githubusercontent.com/24622526/43383223-e1234d98-93c9-11e8-944e-3766bfa39952.png)

Create a new job with Freestyle template. and configure the script in the job as shown below.

![image](https://user-images.githubusercontent.com/24622526/43383336-34855044-93ca-11e8-91fb-82a9adbefa0e.png)

Or keep the script in GitHub and configure it in the jenkins job.

![image](https://user-images.githubusercontent.com/24622526/43383731-6e588b78-93cb-11e8-8294-b1e47ebc0be7.png)

Refer the groovy file in jenkins job configuration:

![image](https://user-images.githubusercontent.com/24622526/43383756-7fdc66bc-93cb-11e8-8767-15868b4978b4.png)

### If you want to pass the paramter from jenkins and read the parameter value in groovy script.

![image](https://user-images.githubusercontent.com/24622526/43384336-44fc229c-93cd-11e8-8b0a-9fb1f7f85691.png)

![image](https://user-images.githubusercontent.com/24622526/43384260-005c77cc-93cd-11e8-89e8-e0ac96b94291.png)

# Known Issue:

![image](https://user-images.githubusercontent.com/24622526/43384417-859cff4c-93cd-11e8-808c-c5a3ebb1b805.png)

### Solution: Go to ManageJenkins --> In-Process script Approval --> Approve (You may need to do this again whenever you get this type of issue)

![image](https://user-images.githubusercontent.com/24622526/43384466-aa911ac2-93cd-11e8-98bc-107e5ce645dc.png)

![image](https://user-images.githubusercontent.com/24622526/43384507-c5319ee2-93cd-11e8-83bf-08c2d304238e.png)




