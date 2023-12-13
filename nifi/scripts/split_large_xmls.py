import os
from xml.etree import ElementTree


ds_dir = './data/datascience'
posts_path = f'{ds_dir}/Posts.xml'
posthistory_path = f'{ds_dir}/PostHistory.xml'
users_path = f'{ds_dir}/Users.xml'

CHUNK_SIZE = 10000

def split(ctx, main_tag):
    new_dir = f'{ds_dir}/{main_tag}_split'
    os.makedirs(new_dir, exist_ok=True)
    for i, (event, elem) in enumerate(context):
        if elem.tag == 'row':
            post_id = elem.attrib['Id']
            if i % CHUNK_SIZE == 0:
                # end current file
                if i != 0:
                    with open(curr_file_path, 'ba') as f:
                        f.write(f'</{main_tag}>'.encode())
                # start new file
                curr_file_path = f'{new_dir}/{main_tag}-{post_id}.xml'
                with open(curr_file_path, 'ba') as f:
                    f.write(b'<?xml version="1.0" encoding="utf-8"?>\n')
                    f.write(f'<{main_tag}>'.encode())
            with open(curr_file_path, 'ba') as f:
                f.write(ElementTree.tostring(elem))
    # end unfinished file
    if i % CHUNK_SIZE != 0:
        with open(curr_file_path, 'ba') as f:
            f.write(f'</{main_tag}>'.encode())
    else:
        # remove empty file
        os.remove(curr_file_path)


# split Posts.xml
context = ElementTree.iterparse(posts_path, events=('end', ))
split(context, 'posts')

# split PostHistory.xml
context = ElementTree.iterparse(posthistory_path, events=('end', ))
split(context, 'posthistory')

# split Users.xml
context = ElementTree.iterparse(users_path, events=('end', ))
split(context, 'users')
