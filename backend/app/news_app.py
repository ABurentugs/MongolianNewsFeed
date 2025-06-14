from fastapi import FastAPI

app = FastAPI()

@app.get("/hello")
def hello():
    return {"message": "Hello form FastAPI"}

def main():
    print(f"somethings....")
    

if __name__ == "__main__":
    main()
