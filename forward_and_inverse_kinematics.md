---
layout: post
mathjax: true
comments: true
---
In N-dimensional simplex noise, the squared kernel summation radius $r^2$ is $\frac 1 2$
for all values of N. This is because the edge length of the N-simplex $s = \sqrt {\frac {N} {N + 1}}$
divides out of the N-simplex height $h = s \sqrt {\frac {N + 1} {2N}}$.
The kerel summation radius $r$ is equal to the N-simplex height $h$.

$$ r = h = \sqrt{\frac {1} {2}} = \sqrt{\frac {N} {N+1}} \sqrt{\frac {N+1} {2N}} $$

<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <menclose notation="top top bottom">
    <mtable columnalign="center center center center" rowspacing="4pt" columnspacing="1em" rowlines="solid none">
      <mtr>
        <mtd>
          <mi>i</mi>
        </mtd>
        <mtd>
          <msub>
            <mi>&#x03B1;<!-- α --></mi>
            <mrow class="MJX-TeXAtom-ORD">
              <mi>i</mi>
            </mrow>
          </msub>
        </mtd>
        <mtd>
          <msub>
            <mi>a</mi>
            <mrow class="MJX-TeXAtom-ORD">
              <mi>i</mi>
            </mrow>
          </msub>
        </mtd>
        <mtd>
          <msub>
            <mi>d</mi>
            <mi>i</mi>
          </msub>
        </mtd>
        <mtd>
          <msub>
            <mi>&#x03B8;<!-- θ --></mi>
            <mi>i</mi>
          </msub>
        </mtd>
      </mtr>
      <mtr>
        <mtd>
          <mn>1</mn>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <msub>
            <mi>l</mi>
            <mn>1</mn>
          </msub>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <msub>
            <mi>&#x03B8;<!-- θ --></mi>
            <mn>1</mn>
          </msub>
        </mtd>
      </mtr>
      <mtr>
        <mtd>
          <mn>2</mn>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <msub>
            <mi>l</mi>
            <mn>2</mn>
          </msub>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <msub>
            <mi>&#x03B8;<!-- θ --></mi>
            <mn>2</mn>
          </msub>
        </mtd>
      </mtr>
    </mtable>
  </menclose>
</math>
