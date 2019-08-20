1. Go to S3. Create a bucket in S3 with the name as same as the recordset which we want to create in route53 (but it should ends with the purchased domain name).

    ex: www.example.com, apache.example.com, example.com
    
2. Give public access on S3 bucket.

3. Upload index.html, error.html or your static website.

4. Give public access on those pages.

5. Bucket properties --> Static website hosting --> Use this bucket to host a website


      Index document --> index.html or similar one that you want to load as a starting page.
      
      Error document --> error.html or 404.html or use any html file that you want to load when "Index document" not available.
      
6. Give public access on both "Index document" & "Error document".

7. Go to Route53 --> Hosted Zones --> Create Record Set --> Name (as same as s3 bucket, but it should ends with the domain name)

    ex: www.example.com, apache.example.com, example.com
    
8. Alias --> yes

9. Alias Target --> choose the S3 bucket name from the list.

10. Save.

11. Launch the URL in any browser in any machine with domain(record setname or s3 bucket name), ex: www.example.com, apache.example.com, example.com.

    It will load the web file which we configured at "Index document".

12. Remove index.html (or the document name which you refer for "Index document") from s3 bucket.

13. Launch the URL agian. (This time you should navigate to the static file which we configured at "Error document").
      

