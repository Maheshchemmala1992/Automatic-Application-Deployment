Setup Steps in Jenkins

    Create AWS Credentials in Jenkins

        Go to: Manage Jenkins → Credentials → System → Global credentials

        Add two credentials:

            ID: aws-access-key-id → Secret Text: <Your AWS Access Key>

            ID: aws-secret-access-key → Secret Text: <Your AWS Secret Key>

    Create Pipeline Job

        In Jenkins, click New Item → Choose Pipeline.

        In Pipeline Definition, select Pipeline script from SCM.

        SCM: Git

        Repository URL:

    https://github.com/praveenkumarpentamalla/Automatic-Application-Deployment.git

    Script Path: Jenkinsfile (you need to add the above file into your repo root).

Run Pipeline

    Click Build Now.

    Jenkins will pull your repo, run Terraform, and create the EC2 in us-east-2 (Ohio).
