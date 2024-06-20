event_inherited();
state = 0;
face = 1;
isTimer = false;
timeLimit = 60*3;
prev_x = x;
prev_y = y;
target_x = x;
target_y = y;
interp_factor = .3;
chaseSpeed = 2;


face = 3;

sprite[0] = SkeletonWithSwordRightIdle;
sprite[1] = SkeletonWithSwordUpIdle;
sprite[2] = SkeletonWithSwordLefttIdle;
sprite[3] = SkeletonWithSwordDownIdle;

runSprite[0] = SkeletonWithSwordRightRun;
runSprite[1] = SkeletonWithSwordUpWalk;
runSprite[2] = SkeletonWithSwordLefttRun;
runSprite[3] = SkeletonWithSwordDownWalk;


