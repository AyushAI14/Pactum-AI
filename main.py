# def main():
#     print("Hello from pactum-ai!")
    

# if __name__ == "__main__":
#     main()

#Database test code in fast api ---------------------------------
from fastapi import FastAPI
from backend.db import get_conn
import uvicorn

app = FastAPI()

@app.get("/db-test")
def db_test():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT 1;")
    result = cur.fetchone()
    conn.close()
    return {"db": result[0]}
    
if __name__ == '__main__':
    uvicorn.run('main:app',host='0.0.0.0',port=5000)