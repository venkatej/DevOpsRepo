# Groovy Script


### List all the Jenkins jobs

          Jenkins.instance.getAllItems(AbstractProject.class).each {it ->
            println it.fullName;
          }

          Or

          Jenkins.instance.items*.fullName.join('\n')

### List all the Jenkins jobs based on the regular expression

          import jenkins.model.*

          def matchedJobs = Jenkins.instance.items.findAll { job ->
              job.name =~ /New/
          }

          matchedJobs.each { job ->
              println job.name
              //job.delete()
          }
          
### Create a new job in Jenkins

          import jenkins.model.Jenkins;
          import hudson.model.FreeStyleProject;
          import hudson.tasks.Shell;

          job = Jenkins.instance.createProject(FreeStyleProject, 'job-name')

          job.buildersList.add(new Shell('echo hello world'))

          job.save()


### Create a new job by copying the existing job in Jenkins

          def template = hudson.model.Hudson.instance.getItem('job-name')

          job = hudson.model.Hudson.instance.copy(template, 'New-Project')

          job.setDescription("This job created from the exisitng job job-name")

          job.save()

### Update the Job description of exisitng job

          def job = hudson.model.Hudson.instance.getItem('job-name')

          job.setDescription("updating the job description using groovy script")

          job.save()

### List all the Jenkins jobs based on the regular expression & delete

          import jenkins.model.*

          def matchedJobs = Jenkins.instance.items.findAll { job ->
              job.name =~ /New/
          }

          matchedJobs.each { job ->
              println job.name
              job.delete()
          }
          
### List all the DISABLED Jenkins jobs

          import jenkins.model.*

          def matchedJobs = Jenkins.instance.items.findAll { job ->
              job.name =~ /New/
          }

          matchedJobs.each { job ->

              if(job.disabled){
                println("Diabled job"+job.name)
            }

          }

### List all the DISABLED Jenkins jobs & delete

          import jenkins.model.*

          def matchedJobs = Jenkins.instance.items.findAll { job ->
              job.name =~ /New/
          }

          matchedJobs.each { job ->
              println job.name
              job.delete()
          }

### List all the DISABLED Jenkins jobs & delete & print the enabled jobs

          import jenkins.model.*

          def matchedJobs = Jenkins.instance.items.findAll { job ->
              job.name =~ /New/
          }

          matchedJobs.each { job ->
              //println job.name

            if(job.disabled){
                println("Diabled job"+job.name)
                job.delete()
              }else println "Enabled jobs: "+job.name
          }
          
### Create a jenkins job along with GitURL

          import hudson.tasks.Shell

          def repository = 'https://github.com/DayToDayDevOpsCourse/MavenDayToDayCourse.git' 

          job = Jenkins.instance.createProject(FreeStyleProject, 'TestJob')

          job.setDescription("Some description") 

          job.scm = new hudson.plugins.git.GitSCM(repository) 

          job.save()

### Create a jenkins job along with GitURL & branch

          import hudson.tasks.Shell

          def repository = 'https://github.com/DayToDayDevOpsCourse/MavenDayToDayCourse.git' 

          job = Jenkins.instance.createProject(FreeStyleProject, 'TestJob')

          job.setDescription("Some description") 

          job.scm = new hudson.plugins.git.GitSCM(repository) 

          def gitScm = job.scm

          gitScm.branches = [new hudson.plugins.git.BranchSpec('master')]

          job.save()

### Add the credentials to Jenkins

          import jenkins.model.*
          import com.cloudbees.plugins.credentials.*
          import com.cloudbees.plugins.credentials.common.*
          import com.cloudbees.plugins.credentials.domains.*
          import com.cloudbees.plugins.credentials.impl.*
          import com.cloudbees.jenkins.plugins.sshcredentials.impl.*
          import hudson.plugins.sshslaves.*;

          domain = Domain.global()
          store = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()



          usernameAndPassword = new UsernamePasswordCredentialsImpl(
            CredentialsScope.GLOBAL,
            "JenkinsGitHub", "JenkinsGitHub",
            "venkatasykam",
            "Forgot#1987"
          )

          store.addCredentials(domain, usernameAndPassword)
