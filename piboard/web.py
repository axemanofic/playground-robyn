import platform

from robyn import ALLOW_CORS, Robyn


def create_app():
    return Robyn(__file__)


app = create_app()

ALLOW_CORS(app, origins=["*"])

@app.get("/api/info")
def info():
    os_name = platform.system().lower()
    temp = None
    if os_name == 'linux':
        with open('/sys/class/hwmon/hwmon0/temp1_input', 'r') as f:
            temp = f.read()
        temp = float(temp) / 1000
    return {'temp': temp}
