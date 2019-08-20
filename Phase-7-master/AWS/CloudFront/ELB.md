
### Example with ELB (Dymanic Web content)

1. Create Image(AMI) where DevOpsWebApp can be deployed to tomcat. Refer to install tomcat: https://github.com/DevOpsPlatform/Phase-1/blob/master/tomcat9-setup-on-ubuntu.md

2. Create two instances with same AMI.

3. Create Application Load Balancer as to target the two instances.

4. Create **CloudFront Distributions**, with `Origin Path` as **/DevOpsWebApp-1.0.0** AND `Default Root Object` as **index.jsp**.

![image](https://user-images.githubusercontent.com/24622526/50066908-5c0c6c00-01e4-11e9-99c4-00d716d6f315.png)

![image](https://user-images.githubusercontent.com/24622526/50066955-91b15500-01e4-11e9-9ba5-7e6261161e33.png)

![image](https://user-images.githubusercontent.com/24622526/50066997-c6bda780-01e4-11e9-94bc-a7021e5150a5.png)

![image](https://user-images.githubusercontent.com/24622526/50067028-ee147480-01e4-11e9-834b-4e4cad586773.png)

5. Fill the details as shown in above images, and choose other default values.

6. Click on **Create Distribution**, this might take 5 to 10 mins to complete. CloudFront sends your distribution's configuration (but not your content) to all of its edge locations—collections of servers in geographically dispersed data centers where CloudFront caches copies of your objects.

![image](https://user-images.githubusercontent.com/24622526/50067087-2e73f280-01e5-11e9-92eb-991ff2d3f3da.png)

7. CloudFront assigns a domain name to your new distribution that you can see in the CloudFront console. Once the status is **Deployed**, then copy the domain name and launch it in any browser any where.

![image](https://user-images.githubusercontent.com/24622526/50067616-aba06700-01e7-11e9-8187-86389d7f5344.png)

![image](https://user-images.githubusercontent.com/24622526/50067635-c672db80-01e7-11e9-85c3-417a99d21e6d.png)

8. First **Disbale** the distribution, and then delete once the status is **Deployed**. This will take around 10 to 15 mins.

![image](https://user-images.githubusercontent.com/24622526/50067653-e4d8d700-01e7-11e9-891a-5eba55d5cd19.png)

![image](https://user-images.githubusercontent.com/24622526/50068069-1ce11980-01ea-11e9-8f76-413d567b67f2.png)
