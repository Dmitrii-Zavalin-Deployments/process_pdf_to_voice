import fitz  # PyMuPDF
import os
import sys

def pdf_to_text(pdf_path, overwrite=False):
    # Open the PDF file
    pdf_document = fitz.open(pdf_path)
    text = ""

    # Iterate through each page and extract text
    for page_num in range(len(pdf_document)):
        page = pdf_document.load_page(page_num)
        text += page.get_text()

    # Create a text file path with the same base name as the PDF
    txt_path = os.path.splitext(pdf_path)[0] + ".txt"

    # Check if the text file already exists
    if os.path.exists(txt_path) and not overwrite:
        print(f"The file {txt_path} already exists.")
        return txt_path

    # Write the extracted text to the file
    with open(txt_path, "w", encoding="utf-8") as txt_file:
        txt_file.write(text)

    print(f"Text extracted and saved to {txt_path}")
    return txt_path

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python pdf_to_text.py <path_to_pdf> [overwrite]")
        sys.exit(1)
        
    pdf_path = sys.argv[1]
    overwrite = sys.argv[2].lower() == 'true' if len(sys.argv) > 2 else False

    # Check if the path exists and is a file
    if os.path.isfile(pdf_path):
        txt_path = pdf_to_text(pdf_path, overwrite)
        if txt_path:
            print(txt_path)  # Print path for shell script capture
    else:
        print("The provided path is not a valid file.")
        sys.exit(1)