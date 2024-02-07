



## Using annotations¶

Lorem ipsum dolor sit amet, (1) consectetur adipiscing elit.
{ .annotate }

1.  :man_raising_hand: I'm an annotation! I can contain `code`, __formatted
    text__, images, ... basically anything that can be expressed in Markdown.

## Highlighting specific lines

Specific lines can be highlighted by passing the line numbers to the hl_lines argument placed right after the language shortcode. 
Note that line counts start at 1, regardless of the starting line number specified as part of linenums:


``` py hl_lines="3-5"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```


## Footnotes

Lorem ipsum[^1] dolor sit amet, consectetur adipiscing elit.[^2]



### Highlighting changes

- [Critic]{ data-preview="" }
- [Caret, Mark & Tilde]{ data-preview="" }

When [Critic] is enabled, [Critic Markup] can be used, which adds the ability to
highlight suggested changes, as well as add inline comments to a document:

```title="Text with suggested changes"
Text can be {--deleted--} and replacement text {++added++}. This can also be
combined into {~~one~>a single~~} operation. {==Highlighting==} is also
possible {>>and comments can be added inline<<}.
```

{==

Formatting can also be applied to blocks by putting the opening and closing
tags on separate lines and adding new lines between the tags and the content.

==}


## Keyboard Icons 

`kbd`

``` markdown title="Keyboard keys"
++ctrl+alt+del++
```

<div class="result" markdown>

++ctrl+alt+del++

</div>


### Image captions

Sadly, the Markdown syntax doesn't provide native support for image captions,
but it's always possible to use the [Markdown in HTML] extension with literal
`figure` and `figcaption` tags:

``` html title="Image with caption"
<figure markdown>
  ![Image title](https://dummyimage.com/600x400/){ width="300" }
  <figcaption>Image caption</figcaption>
</figure>
```

<div class="result">
  <figure>
    <img src="https://dummyimage.com/600x400/f5f5f5/aaaaaa?text=–%20Image%20–" width="300" />
    <figcaption>Image caption</figcaption>
  </figure>
</div>