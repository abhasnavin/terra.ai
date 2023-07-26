import streamlit as st
import os


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
# Function to process user input based on loaded file contents and generate the chatbot response
def get_chatbot_response(user_input, file_contents):
    # Concatenate all file contents into a single string for context
    context = " ".join(file_contents.values())

    # Use the OpenAI API to generate the chatbot response
    response = openai.Completion.create(
        engine="text-davinci-002",  # Choose the appropriate GPT-3 engine
        prompt=context + " " + user_input,
        max_tokens=4000
    )

    return "Chatbot says: " + response['choices'][0]['text'].strip()


def main():
    # Local folder path
    folder_path = './modules/s3/'

    # Load files from local folder
    file_contents = load_files_from_local(folder_path)

    st.title("Chatbot")

    user_input = st.text_input("You:")
    if st.button("Send"):
        response = get_chatbot_response(user_input, file_contents)
        st.text(response)


if __name__ == "__main__":
    main()
