import streamlit as st
import os
import openai
import time

openai.api_key = "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"
repo_name = "https://github.com/rahulgoyal01/terra.ai"

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
def get_chatbot_response(user_input, chat_history):
    # Use the OpenAI API to generate the chatbot response
    response = openai.ChatCompletion.create(
        model=model,
        temperature=0.01,
        messages=[
            {"role": "system",
            "content": "You are a Terraform Developer.  \
                        You will be using files and data that holds resource blocks, variable blocks and output blocks for terraform code. \
                        You will use this code as an input to generate module blocks for the resources to deploy. \
                        Just reply with the module block code only and nothing else.\
                        The output module block must have correct value like variable names and default values."},
            {"role": "user", "content": chat_history + " " + user_input},
        ],
    )

    return "Chatbot says: " + response['choices'][0]['message']['content'].strip()


# Function to generate a unique key based on the user input and iteration count
def generate_widget_key(user_input, iteration, widget_type):
    return f"{user_input}_{iteration}_{widget_type}"


def main():
    # Local folder path
    folder_path = './modules/s3/'

    # Load files from local folder
    file_contents = load_files_from_local(folder_path)

    st.title("TerraBot")

    # Initial chat history with system message and file contents
    chat_history = "You are a Terraform Developer.  \
                    You will be using files and data that holds resource blocks, variable blocks and output blocks for terraform code. \
                    You will use this code as an input to generate module blocks for the resources to deploy. \
                    Just reply with the module block code only and nothing else.\
                    The output module block must have correct value like variable names and default values."

    chat_history += " ".join(file_contents.values())

    user_input = st.text_input("User Input", value="", key="user_input_1")

    def button_handler():
        # Define chat history inside the function
        chat_history = "You are a Terraform Developer.  \
                    You will be using files and data that holds resource blocks, variable blocks and output blocks for terraform code. \
                    You will use this code as an input to generate module blocks for the resources to deploy. \
                    Just reply with the module block code only and nothing else.\
                    The output module block must have correct value like variable names and default values."

        # Get user input
        user_input = st.text_input("User Input", value="", key="user_input_2")

        # Generate chatbot response using current chat history
        response = get_chatbot_response(user_input, chat_history)

        # Display chatbot response
        st.text(response)

        # Update chat history for the next iteration
        chat_history += " " + user_input
        chat_history += " " + response[len("Chatbot says: "):]

    if st.button("Send", key="button_1"):
        button_handler()


if __name__ == "__main__":
    main()
