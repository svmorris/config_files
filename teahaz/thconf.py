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



        if mes == message:
            break

        mes = message


    if message[:len('EMOJIFY')-1] == "EMOJIFY":
        final_message = ""
        for i, a in enumerate(message[len('EMOJIFY')-1:]):
            if a == ' ': final_message +=  '  '
            if a == 'a': final_message +=  ' :regional_indicator_a: '
            if a == 'b': final_message += ' :regional_indicator_b: '
            if a == 'c': final_message += ' :regional_indicator_c: '
            if a == 'd': final_message += ' :regional_indicator_d: '
            if a == 'e': final_message += ' :regional_indicator_e: '
            if a == 'f': final_message += ' :regional_indicator_f: '
            if a == 'g': final_message += ' :regional_indicator_g: '
            if a == 'h': final_message += ' :regional_indicator_h: '
            if a == 'i': final_message += ' :regional_indicator_i: '
            if a == 'j': final_message += ' :regional_indicator_j: '
            if a == 'k': final_message += ' :regional_indicator_k: '
            if a == 'l': final_message += ' :regional_indicator_l: '
            if a == 'm': final_message += ' :regional_indicator_m: '
            if a == 'n': final_message += ' :regional_indicator_n: '
            if a == 'o': final_message += ' :regional_indicator_o: '
            if a == 'p': final_message += ' :regional_indicator_p: '
            if a == 'q': final_message += ' :regional_indicator_q: '
            if a == 'r': final_message += ' :regional_indicator_r: '
            if a == 's': final_message += ' :regional_indicator_s: '
            if a == 't': final_message += ' :regional_indicator_t: '
            if a == 'u': final_message += ' :regional_indicator_u: '
            if a == 'v': final_message += ' :regional_indicator_v: '
            if a == 'w': final_message += ' :regional_indicator_w: '
            if a == 'x': final_message += ' :regional_indicator_x: '
            if a == 'y': final_message += ' :regional_indicator_y: '
            if a == 'z': final_message += ' :regional_indicator_z: '

        return final_message
    return message



# while 1:
#     import time
#     time.sleep(1)
#     print("sending")
#     hook__message_get([{"nickname": "hec"},{"nickname": "hec"}], None)
#     print(get_if_focused())
