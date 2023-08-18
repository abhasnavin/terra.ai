import streamlit as st
import os
import openai
import git
import requests

openai.api_key = "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"
github_token = "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"  # Replace with your GitHub token
repo_name = "https://github.com/rahulgoyal01/terra.ai"
workflow_id = "terraform-dev.yml"  # Replace with your GitHub Actions workflow ID

# Set the model to use for generating responses
model = "gpt-3.5-turbo"

# Function to read files from the local folder and store their content in a dictionary
def load_files_from_local(folder_path):
    file_contents = {}
    for file_name in os.listdir(folder_path):
        if file_name.endswith('.tf'):
            file_path = os.path.join(folder_path, file_name)
            with open(file_path, 'r') as file:
                file_contents[file_name] = file.read()

    return file_contents


# Function to process user input based on loaded file contents and generate the chatbot response
def get_chatbot_response(user_input, file_contents):
    # Concatenate all file contents into a single string for context
    context = " ".join(file_contents.values())

    # Use the OpenAI API to generate the chatbot response
    response = openai.ChatCompletion.create(
        model=model,
        temperature=0.01,
        messages=[
            {"role": "system", "content": "You are a Terraform Developer.  \
                                          You will be using files and data that holds resource blocks, variable blocks and output blocks for terraform code. \
                                          You will use this code as an input to generate module blocks for the resources to deploy. \
                                          Just reply with the module block code only and nothing else.\
                                          The output module block must have correct value like variable names and default values. \
                                          The value of a variable in a module block should not be a variable. Assume default values for them."},
            {"role": "user", "content": context + " " + user_input},
        ],
    )

    return "#Chatbot says: \n" + response['choices'][0]['message']['content'].strip()


# Function to write the chatbot response to the /env/dev/s3.tf file
def write_to_file(response):
    file_path = './env/dev/s3.tf'
    with open(file_path, 'w') as file:
        file.write(response)


# Function to commit and push changes to the GitHub repository
def commit_and_push_changes():
    repo = git.Repo(".")
    repo.git.add(update=True)
    repo.index.commit("ChatGPT response updated")
    origin = repo.remote(name="origin")
    origin.push()

def get_workflow_status(repo_name, workflow_id):
    headers = {
        "Authorization": f"Bearer {github_token}",
        "Accept": "application/vnd.github.v3+json"
    }
    url = f"https://api.github.com/repos/{repo_name}/actions/workflows/{workflow_id}/runs"
    response = requests.get(url, headers=headers)
    data = response.json()
    if data and "workflow_runs" in data:
        latest_run = data["workflow_runs"][0]
        return latest_run["conclusion"]
    return None


def main():
    # Local folder path
    folder_path = './modules/s3/'

    # Load files from local folder
    file_contents = load_files_from_local(folder_path)

    st.title("Chatbot")

    user_input = st.text_area("You:")

    # Initialize response as an empty string
    if 'response' not in st.session_state:
        st.session_state.response = ""

    if st.button("Plan"):
        # Update the response variable with the generated chatbot response
        st.session_state.response = get_chatbot_response(user_input, file_contents)
        st.text(st.session_state.response)

    if st.button("Deploy"):
        # Check if a response exists before deploying
        if st.session_state.response:
            write_to_file(st.session_state.response)
            commit_and_push_changes()
            workflow_status = get_workflow_status(repo_name, workflow_id)

            if workflow_status == "success":
                chatbot_response = "The GitHub workflow has passed! You can proceed with deployment."
            else:
                chatbot_response = "The GitHub workflow has failed. Please check the logs for more information."

            st.text(chatbot_response)
        else:
            st.text("Please generate a chatbot response before deploying!")

if __name__ == "__main__":
    main()