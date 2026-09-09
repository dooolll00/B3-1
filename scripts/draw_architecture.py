"""Render a diagram from user-supplied configuration; this is not AWS evidence."""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
ROOT = Path(__file__).resolve().parents[1]
image = Image.new('RGB', (1600, 1050), '#f6f8fc')
d = ImageDraw.Draw(image)
font_path = '/System/Library/Fonts/Supplemental/Arial.ttf'
def font(size):
    return ImageFont.truetype(font_path, size)
def box(bounds, fill, title, lines):
    d.rounded_rectangle(bounds, radius=18, fill=fill, outline='#33465f', width=3)
    x,y,_,_=bounds
    d.text((x+22,y+17), title, font=font(27), fill='#12243a')
    for index,line in enumerate(lines):
        d.text((x+22,y+59+index*32),line,font=font(22),fill='#253b51')
def arrow(points, color='#187b76', width=5):
    d.line(points, fill=color, width=width)
    x,y=points[-1]
    px,py=points[-2]
    if x>px: tri=[(x,y),(x-15,y-9),(x-15,y+9)]
    elif y>py: tri=[(x,y),(x-9,y-15),(x+9,y-15)]
    else: tri=[(x,y),(x+15,y-9),(x+15,y+9)]
    d.polygon(tri,fill=color)
d.text((50,30),'B3-1 | AWS Cloud Architecture',font=font(38),fill='#12243a')
d.text((50,85),'Seoul / ap-northeast-2 | Based on the supplied work log',font=font(23),fill='#4b6179')
box((490,145,1550,930),'#ddecfa','VPC  |  mission-vpc',['10.0.0.0/16'])
box((545,375,1495,880),'#e4f4e9','Public Subnet  |  mission-public-subnet',['10.0.1.0/24  |  ap-northeast-2a'])
box((600,500,1440,840),'#eeeafa','Security Group  |  mission-web-sg',[
    'Inbound: TCP 80 / 0.0.0.0/0; TCP 22 / learner IPv4 /32',
    'Outbound: all traffic (as recorded in the supplied log)'])
box((680,650,1370,805),'#fff0dc','EC2  |  mission-web-server',[
    'Ubuntu / t3.micro / Nginx :80 / EBS 8 GiB gp3',
    'Public 43.201.48.130  |  Private 10.0.1.211'])
box((65,190,385,350),'#ffffff','External client',['Browser: HTTP :80','Admin: SSH :22 (/32)'])
box((550,260,940,350),'#fff8da','Internet Gateway',['mission-igw'])
box((1000,245,1495,350),'#ffffff','Route Table',['0.0.0.0/0 -> mission-igw'])
arrow([(385,290),(550,290)])
arrow([(745,350),(745,362),(572,362),(572,728),(680,728)])
d.text((70,405),'HTTP request reaches the public',font=font(22),fill='#253b51')
d.text((70,439),'IP through the IGW and SG.',font=font(22),fill='#253b51')
d.text((70,500),'SSH follows the same network',font=font(22),fill='#253b51')
d.text((70,534),'path; its source is restricted.',font=font(22),fill='#253b51')
d.text((70,620),'SG applies to the EC2 network',font=font(22),fill='#253b51')
d.text((70,654),'interface (logical boundary).',font=font(22),fill='#253b51')
d.text((70,740),'Subnet route table supplies',font=font(22),fill='#253b51')
d.text((70,774),'the outbound internet route.',font=font(22),fill='#253b51')
d.text((50,977),'Configuration diagram only. Runtime and deletion status require separate evidence.',font=font(23),fill='#4b6179')
image.save(ROOT/'docs/architecture-generated.png')
print('Created docs/architecture-generated.png (1600 x 1050)')
