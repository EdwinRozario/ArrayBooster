#Arraybooster Gem: 
Adds a few more features to a Ruby array. Array can be used like a Queue with rpush, lpush, rpop and lpop. A feature substitute is also added, which allows to substitute a element in the array with another. Data can be pushed to an array with priority with ppush.

#Installation

<tt>gem install arraybooster</tt>


##Use

    require 'arraybooster'

    subject = ['CaptainAmerica', 'Thor', 'HawkEye', 'Hulk', 'IronMan', 'WonderWoman']

    subject.lpush('SuperMan') #Push 'Superman' to the left of the array
    ['SuperMan', 'CaptainAmerica', 'Thor', 'HawkEye', 'Hulk', 'IronMan', 'WonderWoman']

    subject.rpush('AntMan') #Push 'Antman' to the right of the array
    ['IronMan', 'CaptainAmerica', 'Thor', 'HawkEye', 'Hulk', 'IronMan', 'WonderWoman', 'AntMan']

    subject.lpop #Pop from left of the array. arrayname.lpop(n) will pop n elements
    ['CaptainAmerica', 'Thor', 'HawkEye', 'Hulk', 'IronMan', 'WonderWoman', 'AntMan']

    subject.rpop #Pop from right of the array. arrayname.rpop(n) will pop n elements
    ['CaptainAmerica', 'Thor', 'HawkEye', 'Hulk', 'IronMan', '3WonderWoman']

    subject.ppush('Wasp', 2) #Push 'Wasp' with priority 2. So its placed at second position.
    ['CaptainAmerica', 'Wasp', 'Thor', 'HawkEye', 'Hulk', 'IronMan', 'WonderWoman']

    subject.substitute('WonderWoman', 'BlackWidow') #Replaces 'WonderWoman' with 'BlackWidow' from the arry.
    ['CaptainAmerica', 'Thor', 'HawkEye', 'Hulk', 'IronMan', 'BlackWidow']
