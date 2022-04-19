import pygame, random
from pygame.locals import *

def on_grid_random():
    x =random.randint(0,59)
    y =random.randint(0,59)
    return (x*10, y*10)

def collision(c1, c2):
    return (c1[0] == c2[0]) and (c1[1] == c2[1])

UP = 8
DOWN = 2
LEFT = 4
RIGHT = 6

pygame.init()
screen = pygame.display.set_mode((600,600))
pygame.display.set_caption('S N A K E')

snake = [(200, 200), (210, 200), (220, 200)]
snakeskin = pygame.Surface((10,10))
snakeskin.fill((255,255,255))

fruta_posit = on_grid_random()
fruta = pygame.Surface((10,10))
fruta.fill((255,0,0))

direcao = LEFT

clock = pygame.time.Clock()

font = pygame.font.Font('freesansbold.ttf', 18)
score = 0

gameover = False
while not gameover:
    clock.tick(20)
    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            exit()

        if event.type == KEYDOWN:
            if event.key == K_UP and direcao != DOWN:
                direcao = UP
            if event.key == K_DOWN and direcao != UP:
                direcao = DOWN
            if event.key == K_LEFT and direcao != RIGHT:
                direcao = LEFT
            if event.key == K_RIGHT and direcao != LEFT:
                direcao = RIGHT


    if collision(snake[0], fruta_posit):
        fruta_posit =on_grid_random()
        snake.append((0,0))
        score = score + 1

    #regra de colisão da borda
    if snake[0][0] == 600 or snake[0][1] == 600 or snake[0][0] <0 or snake[0][1] <0:
        gameover = True
        break

    #regra de colisão da cobra
    for i in range(1, len(snake) - 1):
        if snake[0][0]==snake[i][0] and snake[0][1]==snake[i][1]:
            gameover = True
            break

    if gameover:
        break

    for i in range(len(snake) - 1, 0, -1):
        snake[i] = (snake[i-1][0], snake[i-1][1])


    if direcao == UP:
        snake[0] = (snake[0][0], snake[0][1] - 10)
    if direcao == DOWN:
        snake[0] = (snake[0][0], snake[0][1] + 10)
    if direcao == LEFT:
        snake[0] = (snake[0][0] - 10, snake[0][1])
    if direcao == RIGHT:
        snake[0] = (snake[0][0] + 10, snake[0][1])
    
    screen.fill((0,0,0))
    screen.blit(fruta, fruta_posit)

    #grade do fundo
    for x in range(0, 600, 10): 
        pygame.draw.line(screen, (40, 40, 40), (x, 0), (x, 600))
    for y in range(0, 600, 10): 
        pygame.draw.line(screen, (40, 40, 40), (0, y), (600, y))

    score_font = font.render('Score: %s' % (score), True, (255, 255, 255))
    score_rect = score_font.get_rect()
    score_rect.topleft = (600 - 120, 10)
    screen.blit(score_font, score_rect)

    for posit in snake:
        screen.blit(snakeskin, posit)

    pygame.display.update()

while True:
    gameover_font = pygame.font.Font('freesansbold.ttf', 75)
    gameover_screen = gameover_font.render('GAME OVER', True, (255,255,255))
    gameover_rect = gameover_screen.get_rect()
    gameover_rect.midtop =(600/2, 25)
    screen.blit(gameover_screen, gameover_rect)
    pygame.display.update()
    pygame.time.wait(500)
    while True:
        for event in pygame.event.get():
            if event.type == QUIT:
                pygame.quit()
                exit()
