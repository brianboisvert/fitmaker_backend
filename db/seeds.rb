# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

titan = Workout.create(title: 'Titan', description: 'Advanced muscle building routine', intensity: 'hard', duration: 45, category: "bodyweight")
venus = Workout.create(title: 'Venus', description: 'Beginner cardio routine', intensity: 'easy', duration: 20, category: "cardio")
apollo = Workout.create(title: 'Apollo', description: 'Muscle building with cardio active recovery', intensity: 'medium', duration: 30, category: "bodyweight/cardio")

lunge = Exercise.create(name: 'lunge', description: 'Stand erect with your feet hip-width apart, chest out, and shoulders back, maintaining the natural curvature of your spine. Your knees should be unlocked and your hand on your hips. This is your starting position. Take a moderate-length step forward with one foot, descending to a point in which your rear knee approaches the floor without touching, maintaining your body\'s upright posture. Your front knee should bend about 90 degrees, but for knee health it should not be forward of the vertical plane that extends straight up from your toes. If so, take a slightly longer step. From the bottom position, push back up from your forward foot, bringing it back beside the other. Repeat on the opposite side for the required number of repetitions.')
pushup = Exercise.create(name: 'pushup', description: 'Lie on the floor face down and place your hands about 36 inches apart while holding your torso up at arms length. Next, lower yourself downward until your chest almost touches the floor as you inhale. Now breathe out and press your upper body back up to the starting position while squeezing your chest. After a brief pause at the top contracted position, you can begin to lower yourself downward again for as many repetitions as needed.')
burpee = Exercise.create(name: 'burpee', description: 'Begin standing with your legs shoulder-width apart. Place your hands on the floor and kick your legs back so you end up with your stomach and thighs on the floor. Your elbows should be bent. From this position, press up like you\'re doing a push-up and push your hips up. Jump your feet under your hips and stand. Finish the movement by jumping in the air and bringing your hands over your head. Repeat.')
jumping_jack = Exercise.create(name: 'jumping jack', description: 'Start by standing with your feet together. In one motion, jump your feet out to the side and raise your arms above your head. Immediately reverse the motion by jumping back to the starting position. Repeat for the recommended amount of repetitions.')

one = WorkoutExercise.create(workout_id: 1, exercise_id: 1)
two = WorkoutExercise.create(workout_id: 1, exercise_id: 2)
three = WorkoutExercise.create(workout_id: 2, exercise_id: 4)
four = WorkoutExercise.create(workout_id: 3, exercise_id: 3)
five = WorkoutExercise.create(workout_id: 3, exercise_id: 1)

brian = User.create(username: 'brian', email: 'brian@boisvert.com', password: 'brian')
