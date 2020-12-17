program chess;
uses GraphABC;

const
     syms : array[1..8] of char = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H');
     nums : array[1..8] of char = ('1', '2', '3', '4', '5', '6', '7', '8');
     
procedure draw_chars;
var
   i : integer;
begin
     SetFontSize(20);
     SetFontName('Times New Roman');

     for i := 1 to 8 do begin
        TextOut(i * 64 + 20, 30, syms[i]);
        TextOut(15, i * 64 + 15, nums[i]);
     end;
end;

procedure draw_desk(c : System.Drawing.Color);
var
   i, j, c : integer;
begin
     c := 1;
     for i := 1 to 8 do begin
         for j := 1 to 8 do begin

             if c = 1 then SetBrushColor(clWhite)
             else SetBrushColor(clBlack);

             Rectangle(j * 64, i * 64, j * 64 + 64, i * 64 + 64);
             c := c * -1;

         end;
         c := c * -1;
    end;
end;

procedure draw_pesh(x, y : integer);
begin
     SetPenColor(clBlack);
     SetBrushColor(clBrown);
     SetBrushStyle(bsSolid);
     Rectangle(x + 30, y + 25, x + 36, y + 50);
     Circle(x + 33, y + 20, 10);
     Rectangle(x + 20, y + 30, x + 44, y + 35);
     Rectangle(x + 20, y + 48, x + 44, y + 55);
end;

procedure draw_lad(x, y : integer);
begin
     SetPenColor(clBlack);
     Rectangle(x + 15, y + 48, x + 50, y + 55);
     Rectangle(x + 30, y + 25, x + 36, y + 50);
     Rectangle(x + 15, y + 25, x + 50, y + 35);
     
     Rectangle(x + 15, y + 10, x + 22, y + 25);
     Rectangle(x + 29, y + 10, x + 37, y + 25);
     Rectangle(x + 42, y + 10, x + 50, y + 25);
end;

procedure draw_horse(x, y : integer);
begin
     SetPenColor(clBlack);
     SetBrushColor(clBrown);
     Rectangle(x + 15, y + 48, x + 50, y + 55);
     Rectangle(x + 18, y + 49, x + 30, y + 12);
     Rectangle(x + 29, y + 12, x + 45, y + 30);
     SetBrushColor(clBlack);
     Line(x + 18, y + 20, x + 25, y + 20);
     Line(x + 18, y + 25, x + 25, y + 25);
     Line(x + 18, y + 30, x + 25, y + 30);
end;

procedure draw_elephant(x, y : integer);
begin
     SetPenColor(clBlack);
     SetBrushStyle(bsSolid);
     SetBrushColor(clBrown);
     Rectangle(x + 30, y + 25, x + 36, y + 50);
     Circle(x + 33, y + 20, 10);
     Circle(x + 33, y + 7, 5);
     Rectangle(x + 20, y + 30, x + 44, y + 35);
     Rectangle(x + 20, y + 48, x + 44, y + 55);
end;

procedure draw_king(x, y : integer);
begin
     SetPenColor(clBlack);
     Rectangle(x + 10, y + 45, x + 54, y + 52);
     Ellipse(x + 2, y + 30, x + 32, y + 45);
     Ellipse(x + 32, y + 30, x + 62, y + 45);
     Ellipse(x + 25, y + 10, x + 40, y + 45);
     Rectangle(x + 32, y + 2, x + 33, y + 10);
     Rectangle(x + 28, y + 4, x + 38, y + 5);
end;

procedure draw_queen(x, y : integer);
begin
     SetPenColor(clBrown);
     Line(x + 7, y + 54, x + 56, y + 54);

     Line(x + 7, y + 9, x + 7, y + 54);
     Line(x + 55, y + 9, x + 55, y + 54);
     
     Line(x + 7, y + 9, x + 20, y + 29);
     Line(x + 20, y + 29, x + 30, y + 9);
     Line(x + 30, y + 9, x + 42, y + 29);
     Line(x + 42, y + 29, x + 56, y + 9);
     floodfill(x + 10, y + 40, clBrown);
end;

var
   i, j, c : integer;
BEGIN
    SetWindowWidth(600);
    SetWindowHeight(600);
    
    draw_chars();
    draw_desk();
    
    for i := 1 to 8 do begin
        draw_pesh(64 * i, 64 * 2);
        draw_pesh(64 * i, 64 * 7);
    end;
    
    draw_lad(1 * 64, 1 * 64);
    draw_lad(1 * 64, 8 * 64);
    
    draw_lad(8 * 64, 8 * 64);
    draw_lad(8 * 64, 1 * 64);
    
    draw_horse(2 * 64, 1 * 64);
    draw_horse(7 * 64, 1 * 64);
    draw_horse(2 * 64, 8 * 64);
    draw_horse(7 * 64, 8 * 64);

    draw_elephant(3 * 64, 1 * 64);
    draw_elephant(6 * 64, 1 * 64);
    draw_elephant(3 * 64, 8 * 64);
    draw_elephant(6 * 64, 8 * 64);
    
    draw_king(4 * 64, 1 * 64);
    draw_queen(5 * 64, 1 * 64);
    
    draw_king(4 * 64, 8 * 64);
    draw_queen(5 * 64, 8 * 64);

END.