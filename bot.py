import streamlit as st
import os
import openai

openai.api_key = "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"
repo_name = "https://github.com/rahulgoyal01/terra.ai"

# Set the model to use for generating responses
model = "gpt-3.5-turbo"
import streamlit as st
import os
import openai

openai.api_key = "YOUR_OPENAI_API_KEY"
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
        messages=[
            {"role": "system", "content": "You are a chatbot."},
            {"role": "user", "content": chat_history + " " + user_input},
        ],
    )

    return "Chatbot says: " + response['choices'][0]['message']['content'].strip()


def main():
    # Local folder path
    folder_path = './modules/s3/'

    # Load files from local folder
    file_contents = load_files_from_local(folder_path)

    st.title("Chatbot")

    # Initial chat history with system message and file contents
    chat_history = "You are a chatbot."
    chat_history += " ".join(file_contents.values())

    while True:
        user_input = st.text_input("You:")
        if st.button("Send"):
            # Generate chatbot response using current chat history
            response = get_chatbot_response(user_input, chat_history)

            # Display chatbot response
            st.text(response)

            # Update chat history for the next iteration
            chat_history += " " + user_input
            chat_history += " " + response[len("Chatbot says: "):]


if __name__ == "__main__":
    main()
