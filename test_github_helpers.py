from github_helpers import get_workflow_status, raise_pull_request, approve_latest_pull_request
from config import repo_name, github_token, workflow_id

def test_get_workflow_status():
    status = get_workflow_status(repo_name, workflow_id, github_token)
    if status == "success":
        print("Github Workflow successfully completed!")
    elif status == "failure":
        print("Workflow failed!")
    else:
        print("Unable to determine workflow status.")


def test_raise_pull_request():
    result = raise_pull_request(repo_name, github_token)
    if result.startswith("Pull request created successfully! URL:"):
        print("Pull request created successfully!")
        print(result)  # Print the URL
    else:
        print("Failed to create a pull request.")

def test_approve_latest_pull_request():
    # Call the function to approve the latest pull request
    result = approve_latest_pull_request(repo_name, github_token)
    
    # Check the result to see if the pull request was approved successfully
    if result == "Pull request approved successfully!":
        print("Pull request was approved successfully!")
    else:
        print("Failed to approve the pull request.")
        print("Result:", result)

if __name__ == "__main__":
    #test_get_workflow_status()
    #test_raise_pull_request()
    test_approve_latest_pull_request()
