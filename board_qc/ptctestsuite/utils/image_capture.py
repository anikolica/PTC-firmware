import asyncio
import cv2

import io

from ptctestsuite.config.parameters import webcam_id, image_width, image_height

def image_proc():
    cap = cv2.VideoCapture(webcam_id)
    
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, image_width)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, image_height)

    while True:
        ret, frame = cap.read()
        """
        if not ret:
            print("Failed to show image!")
            break
        """
        cv2.imshow("Camera", frame)

        key = cv2.waitKey(1) & 0xFF

        if key == 27:
            break
        elif key == 32:
            cap.release()
            cv2.destroyAllWindows()
            return frame


async def get_board_image():
    loop = asyncio.get_event_loop()

    #ret, frame = await loop.run_in_executor(None, cap.read)
    frame = await loop.run_in_executor(None, image_proc)

    success, encoded_image = cv2.imencode('.png', frame)

    if success:
        return io.BytesIO(encoded_image.tobytes()).read()

