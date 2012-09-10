# Coalesce

## Ruby, as a community, unfairly discriminates against `false`, and it needs to stop.

 Do you write code like this? `val = maybe_nil || fallback`

If so, **you are part of the problem!**

`false` is a perfectly non-nil object, and you're excluding it out of convenience!

## C#'s ?? operator

The null coalescing operator `??` is a C# idiom that provides a concise fallback mechanism for expressions that return `null`.

    Object maybeObject = null;
    Object fallbackObject = new Object();
    Object obj = maybeObject ?? fallbackObject;

In Ruby, we generally write this:

    maybe_object = nil
    fallback_object = Object.new
    obj = maybe_object || fallback_object

However, this idiom is only an approximation, and introduces subtle bugs when we try to allow false values:

    maybe_val = false # assumed to be a valid value
    fallback_val = 5
    val = maybe_val || fallback_val # => 5, whoops!

## Meet the _? method

With `coalesce`, you can write this instead:

    maybe_val = false # assumed to be a valid value
    fallback_val = 5
    val = maybe_val._? fallback_val # => false, like we expected!

And if you still need the short-circuiting behavior of the `||` operator, you can pass a block instead:

    val = maybe_val._? { generate_fallback(data) }

## Benefits

I've noticed a positive side-effect of using `_?` is that I explicitly call out when I'm counting on the short-circuiting behavior, and that awareness of the short-circuiting behavior is causing me to use it in ways I would never use `||`.

For example, using it to assert an object's existence before returning it.

    def give_me_the_data
      @data_finder.try_to_find_data._? { raise "Oh no, we suck at finding data!" }
    end

I probably wouldn't think to use a `||` there, and it might look weird, especially with a more complex expression.

And, of course, I'm grateful to be reunited with my long lost friend, `false`.