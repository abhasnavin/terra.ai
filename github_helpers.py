from github import Github
from github import Auth
import time
import logging

# Constants
CHECK_INTERVAL = 60

# # Initialize the logging configuration
# logging.basicConfig(
#     filename='helper_script_log.log',  # Specify the log file name
#     level=logging.DEBUG,  # Set the log level (INFO, DEBUG, etc.)
#     format='%(asctime)s - %(levelname)s - %(message)s',  # Define the log format
# )

def get_workflow_status(repo_name, workflow_id, github_token):
    auth = Auth.Token(github_token)
    g = Github(auth=auth)
    repo = g.get_user().get_repo(repo_name)
    workflow = repo.get_workflow(workflow_id)
    # print(workflow)
    
    max_checks = 30
    status = None  # Initialize status before the loop
    time.sleep(max_checks)

    for _ in range(max_checks):
        try:
            runs = workflow.get_runs()
            if runs.totalCount > 0:
                latest_run = runs[0]
                status = latest_run.conclusion                
                
            if status == "success":
                return "success"
            elif status == "failure":
                return "failure"
        except StopIteration:
            break
        except Exception as e:
            print("Error:", e)
            
        time.sleep(CHECK_INTERVAL)

    return status  # Return the final status after the loop

def get_most_recently_pushed_branch(repo):
    most_recent_commit = None
    most_recent_branch = None
    
    for branch in repo.get_branches():
        commit = branch.commit
        if most_recent_commit is None or commit.commit.author.date > most_recent_commit.commit.author.date:
            most_recent_commit = commit
            most_recent_branch = branch
            
    return most_recent_branch

def raise_pull_request(repo_name, github_token):
    auth = Auth.Token(github_token)
    g = Github(auth=auth)
    repo = g.get_user().get_repo(repo_name)
    
    default_branch = repo.default_branch
    print(default_branch)
    
    most_recent_branch = get_most_recently_pushed_branch(repo)
    print(most_recent_branch)
    
    if most_recent_branch:
        head_branch_name = most_recent_branch.name
        head = f"{repo.owner.login}:{head_branch_name}"  # Format it as "owner:branch"
        print(head)
        title = "Feature Branch Pull Request"
        body = f"This is a pull request from the {head_branch_name} branch."
        print(body)
        
        try:
            pull_request = repo.create_pull(title=title, body=body, base=default_branch, head=head)
            return f"Pull request created successfully! URL: {pull_request.html_url}"
        except Exception as e:
            return f"Error creating pull request: {str(e)}"
    else:
        return "No branches found."
