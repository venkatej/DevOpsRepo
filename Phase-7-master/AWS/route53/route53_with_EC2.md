1. Create EC2 instance.

2. Connect to it.

3. Install apache2 or nginx.

4. Note the Public IP or EC2 instacne.

5. Go to route53 --> Create Record Set --> Type: IPv4 address , Alis: No --> Value: PublicIP of EC2 instance.

6. Copy the Name of record set --> Launch in any browser which is in any machine to access your website.
