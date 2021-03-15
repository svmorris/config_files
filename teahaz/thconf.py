import subprocess
import re
from playsound import playsound


def get_if_focused():
    with open("/proc/self/environ", "r")as infile:
        env = infile.read()


    output = subprocess.check_output(['xprop', '-root', '_NET_ACTIVE_WINDOW'])
    winId = int(output.decode("utf-8").split(" ")[4].strip("\n"), 16)

    if str(winId) in str(env):
        return True
    else:
        return False




def hook__message_get(messages,same_user):
    if same_user or not 0 < len(messages) < 5:
        return 'error'

    focused = get_if_focused()

    if not focused:
        # print("running hook")
        sender = messages[-1].get('nickname')
        subprocess.Popen(f'notify-send "from {sender}" "New message!"',shell=True)
        playsound('/home/antone/.config/teahaz/bruh.mp3')

    return focused




def hook__message_send(message):
    mes = message
    while 1:
        message = re.sub("( :\) |^:\) | :\)$|^:\)$)", " :slightly_smiling_face: ", message, flags=re.IGNORECASE) 
        message = re.sub("( :\( |^:\( | :\($|^:\($)", " :slightly_frowning_face: ", message, flags=re.IGNORECASE) 
        message = re.sub("( angry |^angry | angry$|^angry$)", " :angry: ", message, flags=re.IGNORECASE) 
        message = re.sub("( pog |^pog | pog$|^pog$)", " :regional_indicator_p: :regional_indicator_o: :regional_indicator_g: ", message, flags=re.IGNORECASE) 
        message = re.sub("( i |^i | i$|^i$')", " I ", message, flags=re.IGNORECASE) 
        message = re.sub("( :jo |^:jo | :jo$|^:jo$)", " :joy: ", message, flags=re.IGNORECASE) 

        message = message.replace(" i'", " I'")


        if mes == message:
            break

        mes = message

    message = message.replace(":angry:-:angry:", ":angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry::angry:")
    return message



# while 1:
#     import time
#     time.sleep(1)
#     print("sending")
#     hook__message_get([{"nickname": "hec"},{"nickname": "hec"}], None)
#     print(get_if_focused())
