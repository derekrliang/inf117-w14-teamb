# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(title: 'Active Verbs',
                good_example1: 'The snow drifted down like powdered sugar.',
                good_example2: 'Flames tore through the small opening towards the firefighters.',
                good_example3: 'The toddler teetered precariously on unsteady legs.',
                bad_example1: 'The snow was falling.', 
                bad_example2: 'Flames were coming through the small opening towards the firefighters.', 
                bad_example3: 'The toddler was walking unsteadily across the ground.', 
                description: 'Strong verbs are vibrant, active verbs that are often added during the process of revising a draft. Strong verbs often replace forms of the verb “to be” (is, was, were, are, etc.).')
Category.create(title: 'Participles',
                good_example1: 'Whistling and howling, the wind whipped through the trees.',
                good_example2: 'Digging their boots firmly into the ground, the firefighters braced themselves against the onslaught of the flames.',
                good_example3: 'Squealing and grinning from ear to ear, the toddler triumphantly reached her father.',
                bad_example1: 'The wind whipped through the trees.',
                bad_example2: 'The firefighters braced themselves against the onslaught of the flames.',
                bad_example3: 'The toddler was very happy to reach her father.',
                description: 'When you paint with participles (a form of a verb that is used to modify a noun), you use the –ing or -ed form of a verb at the beginning or the end of a sentence to create action. For example, if you were writing about an angry cat, you might use words like hissing and spitting to create an image of the cat in action.')
Category.create(title: 'Absolutes', 
                good_example1: 'Teeth chattering and bones rattling, she made her way through the storm.',
                good_example2: 'Eyes burning and lungs heaving, the firefighters pushed their way through the curtain of smoke.',
                good_example3: 'Legs trembling and feet scrambling, the little girl righted herself and continued on down the walkway.',
                bad_example1: 'She was very cold as she made her way through the storm.',
                bad_example2: 'The firefighters’ eyes were burning and their lungs were heaving as they pushed their way through the curtain of smoke.',
                bad_example3: 'The little girl got her balance again and continued down the walkway.',
                description: 'An absolute is a two-word combination of a noun plus an –ed or –ing participle (a form of a verb that is used to modify a noun) used to provide detail. For example, if you were writing about an angry cat, you might use absolutes such as claws extended and teeth bared, or eyes rolling and tail twitching, to paint a vivid picture for the reader. Can’t you just imagine that angry beast coming towards you?')
Category.create(title: 'Appositives',
                good_example1: ' The snow, a heavy, wet blanket, clung to her feet as she made her way toward the car.',
                good_example2: 'William, a real hero, sacrificed himself to save his fellow firefighters.',
                good_example3: 'The little girl, a teetering tower of blocks, made her way across the sidewalk.',
                bad_example1: 'The snow clung to her feet as she made her way toward the car.',
                bad_example2: 'William was very brave and sacrificed himself to save his fellow firefighters.',
                bad_example3: 'The little girl made her way across the sidewalk.',
                description: ' An appositive is a noun, set off by commas, that renames the noun that came before it. For example, if you were writing about a mean cat, you might use other nouns such as beast plus an adjective like vicious to let the reader know just how mean that cat is.')
Category.create(title: 'Adjectives Out of Order',
                good_example1: 'The snow, endless and relentless, fell until the entire town disappeared.',
                good_example2: 'The firefighters, dirty and exhausted, hauled the last person to safety before collapsing.',
                good_example3: 'The little girl, teetering and unsteady, made her way across the uneven ground.',
                bad_example1: 'The endless and relentless snow fell until the entire town disappeared.',
                bad_example2: 'The dirty, exhausted firefighters hauled the last person to safety before collapsing.',
                bad_example3: 'The teetering, unsteady little girl made her way across the uneven ground.',
                description: 'Adjectives often come before the noun they are describing, but these adjectives come after the noun they are describing to create a unique descriptive pattern in your writing.')

Question.create(image_url: 'http://i.imgur.com/8ooDsfF.png',
                good_example: 'Good example goes here',
                bad_example: 'Bad example goes here')
Question.create(image_url: 'http://i.imgur.com/138UxHv.png',
                good_example: 'Good example goes here',
                bad_example: 'Bad example goes here')
Question.create(image_url: 'http://i.imgur.com/7vr3d7L.jpg',
                good_example: 'Dog',
                bad_example: 'Dog')
Question.create(image_url: 'http://upload.wikimedia.org/wikipedia/commons/b/b2/US_Navy_080730-N-5277R-003_A_Commander,_Naval_Forces_Japan_firefighter_douses_a_fire_on_a_dummy_aircraft_during_the_annual_off-station_mishap_drill_at_Naval_Support_Facility_Kamiseya.jpg',
                good_example: 'Dog',
                bad_example: 'Dog')

User.create(role: 'teacher', first_name: 'Neal', last_name: 'Young', username: 'nyoung', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'teacher', first_name: 'John', last_name: 'Smith', username: 'jsmith', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'student', first_name: 'Bianca', last_name: 'Tamayo', username: 'btamayo', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'student', first_name: 'Derek', last_name: 'Liang', username: 'dliang', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'student', first_name: 'Lance', last_name: 'Mar', username: 'lmar', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'teacher', first_name: 'first', last_name: 'last', username: 'admin', password: 'aa', password_confirmation: 'aa')
User.create(role: 'student', first_name: 'Kim', last_name: 'Woo', username: 'kwoo', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'teacher', first_name: 'Lang', last_name: 'McWang-Tzu', username: 'mcwang', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'teacher', first_name: 'Bobbie', last_name: 'Yateetsy', username: 'byateet', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'student', first_name: 'Boogie', last_name: 'Boogie', username: 'boogie', password: 'hello123', password_confirmation: 'hello123')
User.create(role: 'student', first_name: 'Diana', last_name: 'Lothrington', username: 'dloth', password: 'hello123', password_confirmation: 'hello123')

Course.create(title: 'English Verbs and Non-Verbs')
Course.create(title: 'Grammar Improvement')
Course.create(title: 'English with an emaphasis on writing')
Course.create(title: 'ESL Course')
