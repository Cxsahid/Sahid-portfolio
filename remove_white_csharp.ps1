$code = @"
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections.Generic;

public class ImageProcessor {
    public static void RemoveBackground(string inputFile, string outputFile) {
        using (Bitmap bmp = new Bitmap(inputFile)) {
            using (Bitmap result = new Bitmap(bmp.Width, bmp.Height, PixelFormat.Format32bppArgb)) {
                using (Graphics g = Graphics.FromImage(result)) {
                    g.DrawImage(bmp, 0, 0);
                }
                
                int width = result.Width;
                int height = result.Height;
                bool[,] visited = new bool[width, height];
                Stack<Point> stack = new Stack<Point>();
                
                // Push corners and edges to start flood fill from outside
                for(int i = 0; i < width; i++) {
                    stack.Push(new Point(i, 0));
                    stack.Push(new Point(i, height - 1));
                }
                for(int j = 0; j < height; j++) {
                    stack.Push(new Point(0, j));
                    stack.Push(new Point(width - 1, j));
                }

                while (stack.Count > 0) {
                    Point pt = stack.Pop();
                    int x = pt.X;
                    int y = pt.Y;
                    
                    if (x < 0 || x >= width || y < 0 || y >= height) continue;
                    if (visited[x, y]) continue;
                    
                    Color c = result.GetPixel(x, y);
                    // Check if pixel is near-white (background)
                    if (c.R > 200 && c.G > 200 && c.B > 200) {
                        visited[x, y] = true;
                        result.SetPixel(x, y, Color.Transparent);
                        stack.Push(new Point(x + 1, y));
                        stack.Push(new Point(x - 1, y));
                        stack.Push(new Point(x, y + 1));
                        stack.Push(new Point(x, y - 1));
                    }
                }
                result.Save(outputFile, ImageFormat.Png);
            }
        }
    }
}
"@
Add-Type -TypeDefinition $code -ReferencedAssemblies System.Drawing
[ImageProcessor]::RemoveBackground("C:\portfolio-template\images\profile_cutout.jpg", "C:\portfolio-template\images\profile_transparent.png")
Write-Host "Smart flood-fill complete!"
