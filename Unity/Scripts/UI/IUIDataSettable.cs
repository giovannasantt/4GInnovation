using System.Collections.Generic;

public interface IUIDataSettable
{
    List<LocalizedString> Name { get; }
    List<LocalizedString> Description { get; }
}
